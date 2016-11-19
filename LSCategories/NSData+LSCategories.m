// Copyright (c) 2016 Leszek S
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSData+LSCategories.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (LSCategories)

- (NSString *)lsMD2
{
    unsigned char digest[CC_MD2_DIGEST_LENGTH];
    CC_MD2(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_MD2_DIGEST_LENGTH];
}

- (NSString *)lsMD4
{
    unsigned char digest[CC_MD4_DIGEST_LENGTH];
    CC_MD4(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_MD4_DIGEST_LENGTH];
}

- (NSString *)lsMD5
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)lsSHA1
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_SHA1_DIGEST_LENGTH];
}

- (NSString *)lsSHA224
{
    unsigned char digest[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_SHA224_DIGEST_LENGTH];
}

- (NSString *)lsSHA256
{
    unsigned char digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_SHA256_DIGEST_LENGTH];
}

- (NSString *)lsSHA384
{
    unsigned char digest[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_SHA384_DIGEST_LENGTH];
}

- (NSString *)lsSHA512
{
    unsigned char digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, digest);
    return [self lsStringFromDigest:digest length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)lsStringUTF8
{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)lsStringFromDigest:(unsigned char[])digest length:(NSInteger)length
{
    NSMutableString *output = [NSMutableString stringWithCapacity:length * 2];
    for (int i = 0; i < length; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    return [output copy];
}

+ (NSArray *)lsContentOfDirectory:(NSSearchPathDirectory)directory
{
    NSString *systemDirectory = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalDirectory = [NSString stringWithFormat:@"%@/LSDATA", systemDirectory];
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:finalDirectory error:NULL];
    return directoryContent;
}

+ (BOOL)lsCleanDirectory:(NSSearchPathDirectory)directory
{
    NSString *systemDirectory = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalDirectory = [NSString stringWithFormat:@"%@/LSDATA", systemDirectory];
    return [[NSFileManager defaultManager] removeItemAtPath:finalDirectory error:NULL];
}

+ (NSData *)lsReadDataFromDirectory:(NSSearchPathDirectory)directory fileName:(NSString *)fileName
{
    if (fileName.length == 0)
        return nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *systemDirectory = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalDirectory = [NSString stringWithFormat:@"%@/LSDATA", systemDirectory];
    [fileManager createDirectoryAtPath:finalDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", finalDirectory, fileName];
    return [NSData dataWithContentsOfFile:filePath];
}

- (BOOL)lsSaveToDirectory:(NSSearchPathDirectory)directory fileName:(NSString *)fileName useExcludeFromBackup:(BOOL)useExcludeFromBackup
{
    if (fileName.length == 0)
        return NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *systemDirectory = [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalDirectory = [NSString stringWithFormat:@"%@/LSDATA", systemDirectory];
    [fileManager createDirectoryAtPath:finalDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", finalDirectory, fileName];
    BOOL result = [self writeToFile:filePath atomically:YES];
    if (result && useExcludeFromBackup)
        [[NSURL fileURLWithPath:filePath] setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:nil];
    return result;
}

+ (void)lsDataFromUrl:(NSURL *)url handler:(void (^)(NSData *data, NSError *error))handler
{
    if (!handler || !url)
    {
        if (handler)
            handler(nil, nil);
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            handler(data, error);
        });
    });
}

@end
