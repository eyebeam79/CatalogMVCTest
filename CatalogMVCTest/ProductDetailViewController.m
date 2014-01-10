//
//  ProductDetailViewController.m
//  CatalogMVCTest
//
//  Created by SDT1 on 2014. 1. 10..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "Catalog.h"
#import "Product.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ProductDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    // 카탈로그에서 제품 정보를 얻어온다.
    Catalog *catalog = [Catalog defaultCatalog];
    Product *product = [catalog productWithCode:self.productCode];
    
    // 제품정보를 뷰에 반영
    self.imageView.image = [UIImage imageNamed:product.imageName];
    self.nameLabel.text = product.name;
    self.priceLabel.text = product.price;
    self.title = product.name;
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
