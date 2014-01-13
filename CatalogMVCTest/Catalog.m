//
//  Catalog.m
//  TabBasedCatalogTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "Catalog.h"


@implementation Catalog
{
    NSArray *data;
    
}

static Catalog *_instance;

// 싱글턴 메소드
+ (id)defaultCatalog
{
    if(_instance == nil)
    {
        _instance = [[Catalog alloc] init];
    }
    
    return _instance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        data = @[[Product product:@"BaseBall" code:@"Ball1" price:@"$100" image:@"Baseball.png"],
                 [Product product:@"BasketBall" code:@"Ball2" price:@"$200" image:@"Basketball.png"],
                 [Product product:@"FootBall" code:@"Ball3" price:@"$250" image:@"Football.png"],
                 [Product product:@"RugbyBall" code:@"Ball4" price:@"$300" image:@"Rugbyball.png"],
                 [Product product:@"Wilson" code:@"Ball5" price:@"$999" image:@"Wilsonball.jpg"]];
    }
    
    return self;
}

- (id)productAt:(int)index
{
    return [data objectAtIndex:index];
}

- (int)numberOfProducts
{
    return [data count];
}

- (Product *)productWithCode:(NSString *)ProductCode
{
    for (Product *one in data)
    {
        if ([one isEqualProduct:ProductCode])
        {
            return one;
        }
    }
    
    return nil;
}


@end
