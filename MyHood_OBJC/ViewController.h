//
//  ViewController.h
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/24/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCell.h"
#import "Post.h"
#import "DataService.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    DataService *myDataService;
}


@end

