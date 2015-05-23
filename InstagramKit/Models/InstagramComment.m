//
//    Copyright (c) 2013 Shyam Bhat
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "InstagramComment.h"
#import "InstagramUser.h"

@implementation InstagramComment

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super initWithInfo:info];
    if (self && ik_dictionaryIsValid(info)) {
        if (ik_dictionaryIsValid(info[kCreator])) {
            _user = [[InstagramUser alloc] initWithInfo:info[kCreator]];
        }
        _text = [[NSString alloc] initWithString:ik_safeString(info[kText])];
        _createdDate = [[NSDate alloc] initWithTimeIntervalSince1970:[ik_safeString(info[kCreatedDate]) doubleValue]];
    }
    return self;
}


- (BOOL)isEqualToComment:(InstagramComment *)comment {
    return [super isEqualToModel:comment];
}


@end
