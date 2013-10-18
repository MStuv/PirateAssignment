//
//  MASFactory.h
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/10/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MASCharacter.h"
#import "MASBoss.h"

@interface MASFactory : NSObject

-(NSArray *)gameTiles;

-(MASCharacter *)gameCharacter;

-(MASBoss *)boss;

@end
