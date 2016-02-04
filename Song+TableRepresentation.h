//
//  Song+TableRepresentation.h
//  SoundCheck
//
//  Created by KEEVIN MITCHELL on 2/3/16.
//  Copyright © 2016 beyond2021. All rights reserved.
//

#import "Song.h"

@interface Song (TableRepresentation)

- (NSDictionary*)tr_tableRepresentation;
@end
