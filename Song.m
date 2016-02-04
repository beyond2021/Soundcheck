//
//  Song.m
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "Song.h"

@implementation Song

- (id)initWithTitle:(NSString*)title ofType:(NSString*)ofType
{
    self = [super init];
    if (self)
    {
        _title = title;
        _ofType = ofType;
           }
    return self;
}



@end
