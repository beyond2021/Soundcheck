//
//  Song+TableRepresentation.m
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "Song+TableRepresentation.h"

@implementation Song (TableRepresentation)

- (NSDictionary*)tr_tableRepresentation
{
    return @{@"titles":@[@"Song",@"ofType"],
             @"values":@[ self.title, self.ofType ]};
}

@end
