//
//  ViewController.m
//  CatalogMVCTest
//
//  Created by SDT1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"
#import "Catalog.h"
#import "Cart.h"
#import "CartItem.h"
#import "CartCell.h"
#import "ProductDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CartDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) Cart *cart;
@end

@implementation ViewController


// 카탈로그 델리게이트: 제품을 카트에 추가한다.
- (void)addItem:(id)sender
{
    // 제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [self.cart addProduct:product];

    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 카트내 상품 수량 증가
- (void)incQuantity:(NSString *)productCode
{
    [self.cart incQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 카트내 상품 수량 감소
- (void)decQuantity:(NSString *)productCode
{
    [self.cart decQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [[Catalog defaultCatalog] numberOfProducts];
    }
    else
    {
        return [self.cart.items count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
        [cell setProductInfo:product];
        
        return cell;
    }
    else
    {
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        cell.delegate = self;
        CartItem *item = self.cart.items[indexPath.row];
        [cell setCartItem:item];
        
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Product";
    }
    else
    {
        return @"Items in Cart";
    }
}

// 상품 보기로 전환
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // 제품 상세보기 뷰컨트롤러
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    // 제품의 코드를 넘겨준다.
    detailVC.productCode = selectedProduct.code;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.cart = [[Cart alloc] init];
    self.cart.items = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
