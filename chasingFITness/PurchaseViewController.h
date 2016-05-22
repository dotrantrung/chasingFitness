//
//  PurchaseViewController.h
//  chasingFITness
//
//  Created by Trung Do on 5/3/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "ViewController.h"
@interface PurchaseViewController : UIViewController<SKPaymentTransactionObserver,SKProductsRequestDelegate>{
    
}
-(void) getProductID;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UIButton *restoreBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong,nonatomic) SKProduct * product;
@property (strong,nonatomic) NSString *productID;
@property (weak, nonatomic) IBOutlet UILabel *productDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;

@end
