//
//  CartViewController.m
//  TabBasedCatalogTest
//
//  Created by Jinho Son on 2014. 1. 11..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "CartViewController.h"
#import "CartDelegate.h"
#import "CartCell.h"
#import "CartItem.h"
#import "Cart.h"


@interface CartViewController () <UITableViewDataSource, UITableViewDelegate, CartCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation CartViewController

// 카트내 상품 수량 증가(델리게이트 메소드)
- (void)incQuantity:(NSString *)productCode
{
    [[Cart defaultCart] incQuantity:productCode];
    [self.table reloadData];
}

// 카트내 상품 수량 감소(델리게이트 메소드)
- (void)decQuantity:(NSString *)productCode
{
    [[Cart defaultCart] decQuantity:productCode];
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Cart defaultCart] numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
    // 수량 추가/감소를 처리할 델리게이트
    cell.delegate = self;
    
    // 셀컨텐츠
    CartItem *item = [[Cart defaultCart] cartItemAtIndex:indexPath.row];
    [cell setCartItem:item];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Items in Cart";
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.table reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
