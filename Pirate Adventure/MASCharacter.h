//
//  MASCharacter.h
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/12/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MASWeapon.h"
#import "MASArmor.h"

@interface MASCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) MASWeapon *characterWeapon;
@property (strong, nonatomic) MASArmor *characterArmor;



@end
