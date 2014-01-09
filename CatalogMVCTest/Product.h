//
//  Product.h
//  PickerViewCatalogTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *code;

+ (id)product:(NSString *)name code:(NSString *)code price:(NSString *)price image:(NSString *)image;

- (BOOL)isEqualProduct:(NSString *)productCode;

@end
