//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    


    return YES;
}


- (NSArray *)holidaysInSeason:(NSString *)season {
    
    return self.database[season];
}

- (NSMutableArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray * supplies = [[self.database[season] objectForKey:holiday] mutableCopy];
    
    if (![self holiday:holiday isInSeason:season] && (![self.database[season] containsObject:season]) ) {
        
        return  nil;
    }
    
        return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    NSArray * holidays = [self.database[season] allKeys];
    BOOL check = [holidays containsObject:holiday];
    
    return check;
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





