//
//  ViewController.m
//  TabBasedCatalogTest
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
#import "CartViewController.h"
#import "ProductDetailViewController.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate, ProductCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController


// 카탈로그 델리게이트: 제품을 카트에 추가한다.
- (void)addItem:(id)sender
{
    // 제품 식별자를 위한 인덱스
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    [[Cart defaultCart] addProduct:product];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[Catalog defaultCatalog] numberOfProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    cell.delegate = self;
    Product *product = [[Catalog defaultCatalog] productAt:indexPath.row];
    [cell setProductInfo:product];
        
    return cell;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return @"Product";
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


- (void)viewWillAppear:(BOOL)animated
{

}

- (void)viewWillDisappear:(BOOL)animated
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
