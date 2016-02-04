//
//  Song.h
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic, copy, readonly) NSString *title, *ofType ;

- (id)initWithTitle:(NSString*)title ofType:(NSString*)ofType;


@end
