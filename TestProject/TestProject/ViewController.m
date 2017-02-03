//
//  ViewController.m
//  TestProject
//
//  Created by Leszek on 03.02.2017.
//  Copyright © 2017 LS. All rights reserved.
//

#import "ViewController.h"
#import "LSCategories.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *test = @"test123!test456!";
    NSLog(@"md2: %@", [test lsMD2]);
    NSLog(@"md4: %@", [test lsMD4]);
    NSLog(@"md5: %@", [test lsMD5]);
    NSLog(@"sha1: %@", [test lsSHA1]);
    NSLog(@"sha224: %@", [test lsSHA224]);
    NSLog(@"sha256: %@", [test lsSHA256]);
    NSLog(@"sha384: %@", [test lsSHA384]);
    NSLog(@"sha512: %@", [test lsSHA512]);
    NSLog(@"rot13: %@", [test lsROT13String]);
    NSLog(@"reversed: %@", [test lsReversedString]);
    NSLog(@"lsStringByRemovingNonLetters: %@", [test lsStringByRemovingNonLetters]);
    NSLog(@"lsStringByRemovingNonNumeric: %@", [test lsStringByRemovingNonNumeric]);
    NSLog(@"lsStringByRemovingNonAlphanumeric: %@", [test lsStringByRemovingNonAlphanumeric]);
    NSLog(@"lsSubstringBetweenStartString: %@", [test lsSubstringBetweenStartString:@"test" endString:@"!"]);
    NSLog(@"lsRangeOfSubstringBetweenStartString: %@", NSStringFromRange([test lsRangeOfSubstringBetweenStartString:@"test" endString:@"!"]));
    NSLog(@"lsAllRangesOfString: %@", [test lsAllRangesOfString:@"es"]);
    NSLog(@"lsRangesOfAllSubstringsBetweenStartString: %@", [test lsRangesOfAllSubstringsBetweenStartString:@"test" endString:@"!"]);
    NSLog(@"lsRandomStringWithLength: %@", [NSString lsRandomStringWithLength:10]);
    NSLog(@"lsUUID: %@", [NSString lsUUID]);
    [NSString lsStringFromUrl:[NSURL URLWithString:@"https://github.com"] handler:^(NSString *string, NSError *error) {
        NSLog(@"lsStringFromUrl: %@...", [string substringToIndex:MIN(string.length, 400)]);
    }];
    
    NSDate *date = [NSDate new];
    NSDate *date2 = [[NSDate new] lsDateByAddingHours:1];
    NSDate *date3 = [[NSDate new] lsDateByAddingHours:2];
    NSLog(@"lsDateComponents: %@", [date lsDateComponents]);
    NSLog(@"lsYear: %@", @([date lsYear]));
    NSLog(@"lsMonth: %@", @([date lsMonth]));
    NSLog(@"lsDay: %@", @([date lsDay]));
    NSLog(@"lsHour: %@", @([date lsHour]));
    NSLog(@"lsMinute: %@", @([date lsMinute]));
    NSLog(@"lsSecond: %@", @([date lsSecond]));
    NSLog(@"lsBeginningOfDay: %@", [[date lsBeginningOfDay] lsStringWithISO8601]);
    NSLog(@"lsEndOfDay: %@", [[date lsEndOfDay] lsStringWithISO8601]);
    NSLog(@"lsBeginningOfNextDay: %@", [[date lsBeginningOfNextDay] lsStringWithISO8601]);
    NSLog(@"lsEndOfPreviousDay: %@", [[date lsEndOfPreviousDay] lsStringWithISO8601]);
    NSLog(@"lsBeginningOfMonth: %@", [[date lsBeginningOfMonth] lsStringWithISO8601]);
    NSLog(@"lsEndOfMonth: %@", [[date lsEndOfMonth] lsStringWithISO8601]);
    NSLog(@"lsBeginningOfNextMonth: %@", [[date lsBeginningOfNextMonth] lsStringWithISO8601]);
    NSLog(@"lsEndOfPreviousMonth: %@", [[date lsEndOfPreviousMonth] lsStringWithISO8601]);
    NSLog(@"lsBeginningOfYear: %@", [[date lsBeginningOfYear] lsStringWithISO8601]);
    NSLog(@"lsEndOfYear: %@", [[date lsEndOfYear] lsStringWithISO8601]);
    NSLog(@"lsBeginningOfNextYear: %@", [[date lsBeginningOfNextYear] lsStringWithISO8601]);
    NSLog(@"lsEndOfPreviousYear: %@", [[date lsEndOfPreviousYear] lsStringWithISO8601]);
    NSLog(@"lsIsToday: %@", @([date lsIsToday]));
    NSLog(@"lsIsTomorrow: %@", @([[date lsDateByAddingHours:5] lsIsTomorrow]));
    NSLog(@"lsIsYesterday: %@", @([[date lsDateByAddingHours:-22] lsIsYesterday]));
    NSLog(@"lsIsEarlierThanDate: %@", @([date lsIsEarlierThanDate:date2]));
    NSLog(@"lsIsLaterThanDate: %@", @([date2 lsIsLaterThanDate:date]));
    NSLog(@"lsIsInBetweenStartDate: %@", @([date2 lsIsInBetweenStartDate:date endDate:date3]));
    NSLog(@"lsDaysDifferenceFromDate: %@", @([date3 lsDaysDifferenceFromDate:date]));
    NSLog(@"lsMonthsDifferenceFromDate: %@", @([date3 lsMonthsDifferenceFromDate:date]));
    NSLog(@"lsMinutesDifferenceFromDate: %@", @([date3 lsMinutesDifferenceFromDate:date]));
    NSLog(@"lsStringWithShortDate: %@", [date lsStringWithShortDate]);
    NSLog(@"lsStringWithShortTime: %@", [date lsStringWithShortTime]);
    NSLog(@"lsStringWithShortDateTime: %@", [date lsStringWithShortDateTime]);
    NSLog(@"lsStringWithMediumDate: %@", [date lsStringWithMediumDate]);
    NSLog(@"lsStringWithMediumTime: %@", [date lsStringWithMediumTime]);
    NSLog(@"lsStringWithMediumDateTime: %@", [date lsStringWithMediumDateTime]);
    NSLog(@"lsStringWithLongDate: %@", [date lsStringWithLongDate]);
    NSLog(@"lsStringWithLongTime: %@", [date lsStringWithLongTime]);
    NSLog(@"lsStringWithLongDateTime: %@", [date lsStringWithLongDateTime]);
    NSLog(@"lsStringWithFormat: %@", [date lsStringWithFormat:@"yyyy     HH"]);
    NSLog(@"lsDateWithString: %@", [NSDate lsDateWithString:@"2017" format:@"yyyy"]);
    NSLog(@"lsDateWithStringWithISO8601: %@", [NSDate lsDateWithStringWithISO8601:@"2017-02-03T00:00:00+01:00"]);
    
    NSArray *array = @[ @0, @1, @2, @3, @4, @5, @6, @7, @8, @9 ];
    NSLog(@"lsReveresedArray: %@", [array lsReveresedArray]);
    NSLog(@"lsShuffledArray: %@", [array lsShuffledArray]);
    NSLog(@"lsRandomObject: %@", [array lsRandomObject]);
    
    NSData *data = [test lsDataUTF8];
    [data lsSaveToDirectory:NSDocumentDirectory fileName:[test lsMD5] useExcludeFromBackup:NO];
    NSData *data2 = [NSData lsReadDataFromDirectory:NSDocumentDirectory fileName:[test lsMD5]];
    NSLog(@"data2: %@", data2);
    NSLog(@"lsStringUTF8 %@", [data2 lsStringUTF8]);
    NSLog(@"lsContentOfCacheDirectory %@", [NSData lsContentOfDirectory:NSDocumentDirectory]);
    [NSData lsCleanDirectory:NSDocumentDirectory];
    NSLog(@"lsContentOfCacheDirectory %@", [NSData lsContentOfDirectory:NSDocumentDirectory]);
    
    [NSDictionary lsDictionaryFromJsonUrl:[NSURL URLWithString:@"https://jsonplaceholder.typicode.com/posts/1/comments"] handler:^(NSDictionary *jsonDictionary, NSError *error) {
        NSLog(@"lsDictionaryFromJsonUrl: %@", jsonDictionary);
        NSLog(@"lsJsonString: %@", [jsonDictionary lsJsonString]);
        NSLog(@"lsDictionaryFromJsonString: %@", [NSDictionary lsDictionaryFromJsonString:[jsonDictionary lsJsonString]]);
    }];
    
    UIColor *color = [UIColor lsRandomColor];
    NSLog(@"lsRandomColor: %@", color);
    NSLog(@"lsInvertedColor: %@", [color lsInvertedColor]);
    NSLog(@"lsRgbHexString: %@", [color lsRgbHexString]);
    NSLog(@"lsRgbaHexString: %@", [color lsRgbaHexString]);
    NSLog(@"lsRgb: %X", [color lsRgb]);
    NSLog(@"lsRgba: %X", [color lsRgba]);
    NSLog(@"lsRed: %f", [color lsRed]);
    NSLog(@"lsGreen: %f", [color lsGreen]);
    NSLog(@"lsBlue: %f", [color lsBlue]);
    NSLog(@"lsAlpha: %f", [color lsAlpha]);
    NSLog(@"lsHue: %f", [color lsHue]);
    NSLog(@"lsSaturation: %f", [color lsSaturation]);
    NSLog(@"lsBrightness: %f", [color lsBrightness]);
    NSLog(@"lsColorWithRgb: %@", [UIColor lsColorWithRgb:0xFF00FF]);
    NSLog(@"lsColorWithRgba: %@", [UIColor lsColorWithRgba:0xFF00FF33]);
    NSLog(@"lsColorWithHexString: %@", [UIColor lsColorWithHexString:@"0xFF00FF"]);
    NSLog(@"lsColorWithHexString: %@", [UIColor lsColorWithHexString:@"0XFF00FF33"]);
    NSLog(@"lsColorWithHexString: %@", [UIColor lsColorWithHexString:@"#F0F"]);
    NSLog(@"lsColorWithHexString: %@", [UIColor lsColorWithHexString:@"F0F3"]);
    
    [test lsAssociatedDictionary][@"test"] = @12345;
    NSLog(@"lsAssociatedDictionary: %@", [test lsAssociatedDictionary]);
    
    UIImage *green = [UIImage lsImageWithColor:[UIColor greenColor] size:CGSizeMake(20, 10)];
    UIImage *gradient = [UIImage lsGradientImageWithSize:CGSizeMake(100, 100) startColor:[UIColor greenColor] endColor:[UIColor blueColor] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
    UIImage *rotated = [gradient lsRotatedImageWithRadians:M_PI_2 / 2];
    UIImage *resized = [gradient lsResizedImageWithSize:CGSizeMake(200, 100)];
    UIImage *resizedProportional = [resized lsResizedProportionalImageWithMaxSize:CGSizeMake(500, 500)];
    UIImage *resizedWithWidth = [resized lsResizedProportionalImageWithWidth:500];
    UIImage *resizedWithHeight = [resized lsResizedProportionalImageWithHeight:500];
    NSLog(@"lsImageWithColor: %@", green);
    NSLog(@"lsGradientImageWithSize: %@", gradient);
    NSLog(@"lsRotatedImageWithRadians: %@", rotated);
    NSLog(@"lsResizedImageWithSize: %@", resized);
    NSLog(@"lsResizedProportionalImageWithMaxSize: %@", resizedProportional);
    NSLog(@"lsResizedProportionalImageWithWidth: %@", resizedWithWidth);
    NSLog(@"lsResizedProportionalImageWithHeight: %@", resizedWithHeight);
    NSLog(@"lsPNG: %@", @([resized lsPNG].length));
    NSLog(@"lsJPEGWithCompressionLevel: %@", @([resized lsJPEGWithCompressionLevel:0.8].length));
    NSLog(@"lsJPEGWithDesiredMaxSize: %@", @([resized lsJPEGWithDesiredMaxSize:2000 allowAboveMax:YES].length));
    NSLog(@"lsRGBARawPixelsData: %@", [green lsRGBARawPixelsData]);
    NSLog(@"lsColorAtPixel: %@", [green lsColorAtPixel:CGPointMake(5, 5)]);
    NSLog(@"lsAverageColor: %@", [green lsAverageColor]);
    
    [self.stackView addArrangedSubview:[[UIImageView alloc] initWithImage:green]];
    [self.stackView addArrangedSubview:[[UIImageView alloc] initWithImage:gradient]];
    [self.stackView addArrangedSubview:[[UIImageView alloc] initWithImage:rotated]];
    UIImageView *rotatedImageView = self.stackView.arrangedSubviews.lastObject;
    
    UILabel *label1 = [UILabel new];
    [self.stackView addArrangedSubview:label1];
    label1.text = @"test <h1>with</h1> <s>some</s> <strong>basic</strong> <em>html</em> <u>tags</u>";
    [label1 lsParseBasicHTMLTags];
    
    UILabel *label2 = [UILabel new];
    [self.stackView addArrangedSubview:label2];
    [label2 lsAddBorderOnEdge:UIRectEdgeTop color:[UIColor greenColor] width:2];
    [label2 lsAddBorderOnEdge:UIRectEdgeBottom color:[UIColor blueColor] width:2];
    [label2 lsAnimateCounterWithStartValue:0 endValue:10000 duration:3 completionBlock:^{
        [label2 lsStartInfiniteRotationWithDuration:2 clockwise:YES];
        [self.stackView.arrangedSubviews.firstObject lsStartInfiniteRotationWithDuration:2 clockwise:NO];
    }];
    
    [UIView lsRepeatWithDuration:2 delay:3 framesPerSecond:60 block:^(CGFloat progress) {
        CGFloat p = progress > 0.5 ? 1 - progress : progress;
        rotatedImageView.transform = CGAffineTransformMakeScale(1 - p, 1 - p);
    }];
}

@end