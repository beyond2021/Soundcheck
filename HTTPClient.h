//
//  HTTPClient.h
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPClient : NSObject

- (id)getRequest:(NSString*)url;
- (id)postRequest:(NSString*)url body:(NSString*)body;


@end
