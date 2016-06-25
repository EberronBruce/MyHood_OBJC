//
//  AddPostVC.h
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"
#import "Post.h"

@interface AddPostVC : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    DataService *myDataService;
}

@end
