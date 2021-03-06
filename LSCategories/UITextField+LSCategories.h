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

#import <UIKit/UIKit.h>

@interface UITextField (LSCategories)

/**
 Sets the maximum text length.
 
 @param maxLength Maximum text length.
 */
- (void)lsSetMaxLength:(NSInteger)maxLength;

/**
 Sets the allowed characters set.
 
 @param allowedCharacterSet Allowed characters set.
 */
- (void)lsSetAllowedCharacterSet:(NSCharacterSet *)allowedCharacterSet;

/**
 Sets left padding for text.
 
 @param leftPadding Left padding for text.
 */
- (void)lsSetLeftPadding:(CGFloat)leftPadding;

/**
 Sets right padding for text.
 
 @param rightPadding Right padding for text.
 */
- (void)lsSetRightPadding:(CGFloat)rightPadding;

/**
 Sets clear button color and mode.
 
 @param color Clear button color.
 @param mode Clear button mode.
 */
- (void)lsSetClearButtonWithColor:(UIColor *)color mode:(UITextFieldViewMode)mode;

/**
 Sets clear button image and mode.
 
 @param image Clear button image.
 @param mode Clear button mode.
 */
- (void)lsSetClearButtonWithImage:(UIImage *)image mode:(UITextFieldViewMode)mode;

@end
