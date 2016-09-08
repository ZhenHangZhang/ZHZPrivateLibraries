//
//  ZHZTools.m
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 16/9/7.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import "ZHZTools.h"
#import <CommonCrypto/CommonDigest.h>


static const NSTimeInterval oneDay = 24 * 60 * 60;

@implementation ZHZTools
+(int)random:(int)x{
    return arc4random() % x;
}
+ (NSString *)md5Encryption:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_BLOCK_BYTES];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    
    NSMutableString *md5Result = [[NSMutableString alloc] init];
    for (int i = 0; i < CC_MD5_BLOCK_BYTES; i++) {
        [md5Result appendFormat:@"%02x", result[i]];
    }
    return md5Result;
}
+ (NSString *)stringDateFromCurrent{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currDateString = [dateformatter stringFromDate:currentDate];
    return currDateString;
}
+ (NSString *)ZHZDateTimeWithOriginalMarketTime:(NSString *)originalMarketTime{
    NSDate *marketTime = [self dateFromString:originalMarketTime];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"dd&MMM , yyyy"];
    NSString *readingENMarketTime = [dateformatter stringFromDate:marketTime];
    return readingENMarketTime;
}
+ (NSDate *)dateFromString:(NSString *)dateStr {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    [inputFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    // 标准时间
    return [inputFormatter dateFromString:dateStr];
}
+ (NSString *)stringDateBeforeTodaySeveralDays:(NSInteger)days {
    NSString *stringDate = @"";
    NSDate *now = [NSDate date];
    NSDate *theDate;
    
    if (days != 0) {
        theDate = [now initWithTimeIntervalSinceNow:(-oneDay * days)];
    } else {
        theDate = now;
    }
    
    stringDate = [ZHZTools stringDateFromDate:theDate];
    
    return stringDate;
}
+ (NSString *)stringDateFromDate:(NSDate *)date {
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateformatter stringFromDate:date];
    return dateString;
}
+ (NSString *)dateStringFromNumberTimer:(NSString *)timerStr{
    //转化为Double
    double t = [timerStr doubleValue];
    //计算出距离1970的NSDate
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:t/1000];
    //转化为 时间格式化字符串
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    //转化为 时间字符串
    return [df stringFromDate:date];
}
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:date];
    
}
+(BOOL)isPhoneNumber:(NSString*)num{
    NSString * MOBILE = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:num] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+(BOOL)isCarNumber:(NSString *)num{
    NSString * MOBILE = @"^[蒙|冀|黑|宁|云|皖|苏|桂|琼|湘|吉|闽|贵|辽|沪|粤|浙|青|鲁|津|京|藏|甘|川|新|赣|豫|晋|陕|鄂|渝]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{5}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:num] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+(BOOL)isEnglishNum:(NSString *)num
{
    NSString *emailRegex = @"[A-Z]";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:num];
}
+(BOOL)isEmailNumber:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if( [emailTest evaluateWithObject:email]){
        
        NSLog(@"恭喜！您输入的邮箱验证合法");
        return YES;
        
    }else{
        return NO;
    }
    return NO;
}
+(BOOL)IsIdentityCardNo:(NSString*)cardNo

{
    if (cardNo.length != 18) {
       return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        NSLog(@"输入的省份证号码不对");
        return NO;
    }
    int sumValue = 0;
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        NSLog(@"验证省份证号码可用");
        return YES;
    }
    return  NO;
}
+(BOOL)isHanWord:(NSString*)str{
    NSString *reges = @" [u4e00-u9fa5] ";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",reges];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }else{
        return NO;
    }
}



@end
