//
//  CartItem.h
//  TabBasedCatalogTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface CartItem : NSObject

@property (weak, nonatomic) Product *product;
@property (nonatomic) int quantity;

@end
