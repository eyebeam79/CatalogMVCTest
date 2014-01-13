//
//  CartDelegate.h
//  PickerViewCatalogTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProductCellDelegate <NSObject>

// 제품에 카트에 추가
- (void)addItem:(id)sender;

@end

@protocol CartCellDelegate <NSObject>

// 제품 코드를 이용해서 수량 증가/감소
- (void)incQuantity:(NSString *)productCode;
- (void)decQuantity:(NSString *)productCode;

@end
