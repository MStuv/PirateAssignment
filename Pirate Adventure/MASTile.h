//
//  MASTile.h
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/10/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MASWeapon.h"
#import "MASArmor.h"

@interface MASTile : NSObject

@property (nonatomic, strong) UIImage *background;
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *actionLabel;

@property (nonatomic, strong) MASWeapon *weapon;
@property (nonatomic, strong) MASArmor *armor;
@property (nonatomic) int effectOnHealth;


@end
