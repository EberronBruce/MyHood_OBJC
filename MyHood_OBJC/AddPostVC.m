//
//  AddPostVC.m
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import "AddPostVC.h"

@interface AddPostVC()
@property (weak, nonatomic) IBOutlet UIImageView *postImg;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *descField;
@end



@implementation AddPostVC

UIImagePickerController *imagePicker;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    myDataService = [DataService sharedInstance];
    
    self.postImg.layer.cornerRadius = self.postImg.frame.size.width/2;
    self.postImg.clipsToBounds = YES;
    imagePicker = [UIImagePickerController new];
    imagePicker.delegate = self;
}

- (IBAction)addPicBtnPressed:(id)sender {
    [sender setTitle:@"" forState:normal];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)makePostBtnPressed:(id)sender {
    NSString *title = self.titleField.text;
    NSString *desc = self.descField.text;
    UIImage *img = self.postImg.image;
    
    if (title) {
        if (img) {
            if(desc) {
                NSString *imgPath = [myDataService saveImageAndCreatePath:img];
                Post *post = [[Post alloc] initWithImagePath:imgPath title:title description:desc];
                [myDataService addPost:post];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
    
}

- (IBAction)cancelBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    self.postImg.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

@end
