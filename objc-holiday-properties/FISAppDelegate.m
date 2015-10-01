//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

/*
 
 @{ @"Winter" : [@{ @"Christmas Day"       :[@[ @"plastic tree"   ,
                                             @"tinsel"         ,
                                             @"lights"         ,
                                             @"presents"       ,
                                             @"wreath"         ,
                                             @"mistletoe"      ,
                                             @"Christmas music"
                                             ] mutableCopy],
 
 */

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return self.database[season];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    if ([self holiday:holiday isInSeason:season]) {
        
        return  [self.database[season] objectForKey:holiday];
    }
    
        return nil;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    return [self.database[season] containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL check = [[self.database[season] objectForKey:holiday] containsObject: supply];
    
    return check;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray * allHolidays = [[self.database[season] allObjects] mutableCopy];
    
    if (![allHolidays containsObject:holiday]) {
     
        NSDictionary * addHoliday = @{ holiday : [@[] mutableCopy] };
        [self.database[season] addEntriesFromDictionary: addHoliday];
    }
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    
    NSMutableArray * allHolidays = [[self.database[season] allObjects] mutableCopy];
    
    if (![allHolidays containsObject:holiday]) {
        NSDictionary * addHoliday = @{ holiday : [@[supply] mutableCopy] };
        [self.database[season] addEntriesFromDictionary: addHoliday];
    } else {
        [[self.database[season] objectForKey:holiday] addObject:supply];
    }
    
}

@end





