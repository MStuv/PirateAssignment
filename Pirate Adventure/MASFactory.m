//
//  MASFactory.m
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/10/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASFactory.h"
#import "MASTile.h"
#import "MASWeapon.h"
#import "MASArmor.h"
@implementation MASFactory



-(NSArray *)gameTiles
{
    /// First Column
    MASTile *tile1A = [[MASTile alloc] init];
    tile1A.background = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1A.story = @"Shiver me timbers Cap'n!\nThat scallywag, Admiral NoBeard, is on the hunt for ye treasure! Ye needs to stop him!!\nWould ye like a cloak of armor to get started?";
    tile1A.actionLabel = @"Take Cloak";
    MASArmor *cloak = [[MASArmor alloc] init];
    cloak.armorName = @"Cloak";
    cloak.healthIncrease = 10;
    tile1A.armor = cloak;
    
    MASTile *tile2A = [[MASTile alloc] init];
    tile2A.background = [UIImage imageNamed:@"cannons.jpg"];
    tile2A.story = @"Ye found cannons for ye ship!!\nThis will help defend ye ship\nagainst Admiral NoBeard!\nDo ye want to change ye weapon!";
    tile2A.actionLabel = @"Install Cannons!";
    MASWeapon *cannons = [[MASWeapon alloc] init];
    cannons.weaponName = @"Cannons";
    cannons.damageIncrease = 40;
    tile2A.weapon = cannons;
    
    MASTile *tile3A = [[MASTile alloc] init];
    tile3A.background = [UIImage imageNamed:@"treasure_skull.jpg"];
    tile3A.story = @"Ye found a small pirate treasure & a cutlass sword! Would ye like to change ye weapon!";
    tile3A.actionLabel = @"Take Cutlass!";
    tile3A.effectOnHealth = 10;
    MASWeapon *sword = [[MASWeapon alloc] init];
    sword.weaponName = @"Cutlass";
    sword.damageIncrease = 20;
    tile3A.weapon = sword;
    
    NSArray *firstColumn = @[tile1A, tile2A, tile3A];

    /// Second Column
    MASTile *tile1B = [[MASTile alloc] init];
    tile1B.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile1B.story = @"Ye have been attached by enemy pirates!!\nDo something Cap'n!!";
    tile1B.actionLabel = @"Take Evasive Action!";
    tile1B.effectOnHealth = -10;
    
    MASTile *tile2B = [[MASTile alloc] init];
    tile2B.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile2B.story = @"Blimey! A scallywag has shot a cannon at\nye starboard side!\n Do something Cap'n!!";
    tile2B.actionLabel = @"Avoid Impact!";
    tile2B.effectOnHealth = -20;
    
    MASTile *tile3B = [[MASTile alloc] init];
    tile3B.background = [UIImage imageNamed:@"Parrot.png"];
    tile3B.story = @"Ye found ye a matey! Every Cap'n needs a parrot! Ye parrot will protect ye.\nWould ye like to switch ye armor to the parrot?";
    MASArmor *parrot = [[MASArmor alloc] init];
    parrot.armorName = @"Parrot";
    parrot.healthIncrease = 35;
    tile3B.armor = parrot;
    tile3B.actionLabel = @"Take ye parrot";

    
    NSArray *secondColumn = @[tile1B, tile2B, tile3B];
    
    /// Third Column
    MASTile *tile1C = [[MASTile alloc] init];
    tile1C.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile1C.story = @"Arr! Ye found the motherload of treasures!\nTaking the treasure will increase ye health!";
    tile1C.actionLabel = @"Pillage the Treasure!";
    tile1C.effectOnHealth = 40;
    
    MASTile *tile2C = [[MASTile alloc] init];
    tile2C.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile2C.story = @"Blimey!\nYe ship has been attacked by Davy Jones' Kraken!\nFire ye cannons to loosen his grip!!";
    tile2C.actionLabel = @"Fire Cannons!";
    tile2C.effectOnHealth = -40;
    
    MASTile *tile3C = [[MASTile alloc] init];
    tile3C.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile3C.story = @"Ye have found a bounty of pistols!\nWould ye like to switch weapons?";
    MASWeapon *pistol = [[MASWeapon alloc] init];
    pistol.weaponName = @"Pistol";
    pistol.damageIncrease = 25;
    tile3C.weapon = pistol;
    tile3C.actionLabel = @"Pick up Pistol!";
    
    NSArray *thirdColumn = @[tile1C, tile2C, tile3C];

    /// Fourth Column
    MASTile *tile1D = [[MASTile alloc] init];
    tile1D.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile1D.story = @"Armor can come in handy when ye enter battle! Would ye like to upgrade ye armor?";
    tile1D.actionLabel = @"Add Steel Armor";
    MASArmor *steel = [[MASArmor alloc] init];
    steel.armorName = @"Steel";
    steel.healthIncrease = 40;
    tile1D.armor = steel;
    
    MASTile *tile2D = [[MASTile alloc] init];
    tile2D.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile2D.story = @"Avast!! Ye arrived at Pirate's Pass.\nYe splice the main brace and increase ye health!";
    tile2D.actionLabel = @"Enjoy Nelson’s folly";
    tile2D.effectOnHealth = 40;
    
    MASTile *tile3D = [[MASTile alloc] init];
    tile3D.background = [UIImage imageNamed:@"no_beard.png"];
    tile3D.story = @"\nShiver me timbers! It's Admiral NoBeard!\nAttack him before he sends ye\nto Davy Jones' Locker!";
    tile3D.actionLabel = @"Attack the Admiral!";
    tile3D.effectOnHealth = -15;
    
    NSArray *fourthColumn = @[tile1D, tile2D, tile3D];
    
    NSArray *gameTiles = @[firstColumn, secondColumn, thirdColumn, fourthColumn];
    
    return gameTiles;
}

-(MASCharacter *)gameCharacter
{
    MASCharacter *gameCharacter = [[MASCharacter alloc] init];
    gameCharacter.health = 100;
    gameCharacter.damage = 5;
        
    MASWeapon *fistsWeapon = [[MASWeapon alloc] init];
    fistsWeapon.weaponName = @"Fists";
    //fistsWeapon.damageIncrease = 5;
    gameCharacter.characterWeapon = fistsWeapon;
    
    MASArmor *noArmor = [[MASArmor alloc] init];
    noArmor.armorName = @"None";
    noArmor.healthIncrease = 0;
    gameCharacter.characterArmor = noArmor;
    
    return gameCharacter;
}

-(MASBoss *)boss
{
    MASBoss *boss = [[MASBoss alloc] init];
    boss.health = 250;
    return boss;
}









@end
