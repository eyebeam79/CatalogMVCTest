//
//  Cart.m
//  CatalogMVCTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "Cart.h"

@implementation Cart

- (void)addProduct:(Product *)item
{
   CartItem *cartItem = [self cartItemWith:item.code];
    
    if(cartItem == nil)
    {
        cartItem = [[CartItem alloc] init];
        
        cartItem.Product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    }
    else
    {
        [self incQuantity:item.code];
    }
    
}

// 카트에 상품 수량을 늘린다.
- (void)incQuantity:(NSString *)productCode
{
    CartItem *item = [self cartItemWith:productCode];
    
    item.quantity++;
}

// 카트에 상품 수량을 줄인다.
- (void)decQuantity:(NSString *)productCode
{
    CartItem *item = [self cartItemWith:productCode];
    
    item.quantity--;
    
    // 제품 수량이 0이면 삭제
    if (item.quantity == 0) {
        [self.items removeObject:item];
    }
}

// 상품 코드로 카트 내 상품 찾기
- (CartItem *)cartItemWith:(NSString *)productCode
{
    for (CartItem *item in self.items)
    {
        if ([item.product isEqualProduct:productCode])
        {
            return item;
        }
    }
    
    return nil;
}
@end
