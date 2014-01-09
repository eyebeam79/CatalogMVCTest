//
//  Catalog.m
//  CatalogMVCTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "Catalog.h"
#import "Product.h"

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
        data = @[[Product product:@"BaseBall" price:@"100" image:@"Baseball.png"],
                 [Product product:@"BasketBall" price:@"200" image:@"Basketball.png"],
                 [Product product:@"FootBall" price:@"250" image:@"Football.png"],
                 [Product product:@"RugbyBall" price:@"300" image:@"Rugbyball.png"],
                 [Product product:@"Wilson" price:@"999" image:@"Wilsonball.jpg"]];
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

@end
