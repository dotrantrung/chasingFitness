//
//  PurchaseViewController.m
//  chasingFITness
//
//  Created by Trung Do on 5/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "PurchaseViewController.h"

@implementation PurchaseViewController
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void) viewDidLoad{
    [super viewDidLoad];
    
}
- (IBAction)tapRestore:(id)sender {
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    
}
-(void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue{
    [self UnlockedPurchase];
    
}
- (IBAction)tapBuy:(id)sender {
    SKPayment *payment = [SKPayment paymentWithProduct:_product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}
- (IBAction)tapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) getProductID{
    if ([SKPaymentQueue canMakePayments]){
        NSSet *a = [NSSet setWithObject:self.productID];
        SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:a ];
        request.delegate = self;
        [request start];
        NSLog(@"success, %@", self.productID);

    }
    else{
        NSLog(@"failed");
        
    }
}

-(void) productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    NSArray * products  = response.products;
    if ([products count] != 0){
        _product = products[0];
        _buyBtn.enabled = YES;
        _productTitleLabel.text = _product.localizedTitle;
        NSLog(@"haha");
        

        _productDescriptionLabel.text = _product.localizedDescription;
    }
    NSArray *myProduct = [[NSArray alloc] initWithArray:response.products];
    
    for(SKProduct *item in myProduct)
    {
        
        NSLog(@"Product title: %@" , item.localizedTitle);
        NSLog(@"Product description: %@" , item.localizedDescription);
        NSLog(@"Product price: %@" , item.price);
        NSLog(@"Product id: %@" , item.productIdentifier);
        
        
    }
    NSLog(@"haha");
    NSLog(@"%lu",(unsigned long)[[response invalidProductIdentifiers] count]);
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }

    for (SKProduct *product in products){
        NSLog(@"product not found: %@",product);
    }
}

-(void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions{
    for (SKPaymentTransaction *transaction in transactions){
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self UnlockedPurchase];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"Transaction failed");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}
-(void) UnlockedPurchase{
    _buyBtn.enabled = NO;
    [_buyBtn setTitle:@"Purchased" forState:UIControlStateNormal];
    _restoreBtn.enabled = NO;
    _restoreBtn.hidden = YES;
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"purchased"];
}
@end
