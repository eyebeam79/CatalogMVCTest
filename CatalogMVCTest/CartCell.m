//
//  CartCell.m
//  TabBasedCatalogTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "CartCell.h"

@implementation CartCell

// 셀에 반영할 내용
- (void)setCartItem:(CartItem *)item
{
    // 제품 구별용 코드
    self.productCode = item.product.code;
    
    // 셀 반영
    self.name.text = item.product.name;
    self.quantity.text = [NSString stringWithFormat:@"%d개", item.quantity];
    
}

// 수량 증가 버튼을 누르면 실행
- (IBAction)plusClicked:(id)sender
{
    [self.delegate incQuantity:self.productCode];
}

// 수량 감소 버튼을 누르면 실행
- (IBAction)minusClicked:(id)sender
{
    [self.delegate decQuantity:self.productCode];
}

@end
