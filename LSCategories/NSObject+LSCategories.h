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

#import <Foundation/Foundation.h>

@interface NSObject (LSCategories)

/**
 Returns string with class name.

 @return String with class name.
 */
+ (NSString *)lsClassName;

/**
 Returns string with class name.
 
 @return String with class name.
 */
- (NSString *)lsClassName;

/**
 Returns mutable dictionary associated to the object.
 Dictionary is created and associated to the object on first call to this method.

 @return Mutable dictionary associated to the object.
 */
- (NSMutableDictionary *)lsAssociatedDictionary;

/**
 Adds a subscription with handler for event with given name.
 
 @param event Event name.
 @param handler Handler to be executed when event with given name occurs.
 @return Subscription ID which can be used for removing added subscription.
 */
- (NSString *)lsSubscribeForEvent:(NSString *)event handler:(void (^)(id data))handler;

/**
 Sends event using given name and optional data.
 
 @param event Event name.
 @param data Optional data which should be send to handlers.
 */
- (void)lsSendEvent:(NSString *)event data:(id)data;

/**
 Removes subscription with given ID.
 
 @param subscriptionId Subscription ID.
 */
- (void)lsRemoveSubscriptionWithId:(NSString *)subscriptionId;

/**
 Removes all subscriptions for given event.
 
 @param event Event name.
 */
- (void)lsRemoveAllSubscriptionsForEvent:(NSString *)event;

/**
 Removes all subscriptions.
 */
- (void)lsRemoveAllSubscriptions;

@end
