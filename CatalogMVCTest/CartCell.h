//
//  CartCell.h
//  TabBasedCatalogTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"
#import "CartItem.h"

@interface CartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantity;
@property (weak, nonatomic) id<CartCellDelegate> delegate;
@property (copy, nonatomic) NSString *productCode;

- (void)setCartItem:(CartItem *)item;


@end
