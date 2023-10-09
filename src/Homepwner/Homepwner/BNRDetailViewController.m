//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by 李仕增 on 2023/9/21.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import <Photos/Photos.h>
#import "BNRImageStore.h"


@interface BNRDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak,nonatomic) IBOutlet UITextField *nameField;
@property (weak,nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak,nonatomic) IBOutlet UITextField *valueField;
@property (weak,nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)tackPicture:(id)sender;
- (IBAction)backgroundTapped:(id)sender;

@end

@implementation BNRDetailViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    // 获取photo
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [[BNRImageStore sharedStore]setImage:image forkey: self.item.itemKey];
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)tackPicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    // 若支持相机请使用相机 否者使用相册
    if ( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 检查照片权限
    [self checkPhotoLibraryPermission];
    [self checkAndRequestCameraPermission];
}

- (void)checkPhotoLibraryPermission {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        
        if (status == PHAuthorizationStatusNotDetermined) {
            // 如果权限尚未获得，请求权限
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus newStatus) {
                if (newStatus == PHAuthorizationStatusAuthorized) {
                    // 用户授予了照片库权限，您可以在这里执行其他操作
                } else {
                    // 用户拒绝了照片库权限，您可以在这里执行其他操作或提供反馈
                }
            }];
        } else if (status == PHAuthorizationStatusAuthorized) {
            // 用户已经授予了照片库权限，您可以在这里执行其他操作
        } else {
            // 用户拒绝或限制了照片库权限，您可以在这里执行其他操作或提供反馈
        }
}

- (void)checkAndRequestCameraPermission {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (status == AVAuthorizationStatusNotDetermined) {
        // 如果权限尚未获得，请求权限
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                // 用户授予了相机权限，您可以在这里执行其他操作
            } else {
                // 用户拒绝了相机权限，您可以在这里执行其他操作或提供反馈
            }
        }];
    } else if (status == AVAuthorizationStatusAuthorized) {
        // 用户已经授予了相机权限，您可以在这里执行其他操作
    } else {
        // 用户拒绝或限制了相机权限，您可以在这里执行其他操作或提供反馈
    }
}

- (void)viewWillAppear:(BOOL)animated
{
          // 即将载入View的时候做些什么
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];

    // 格式化数据 date
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }

    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *itemKey = self.item.itemKey;
    UIImage *imageToDisply = [[BNRImageStore sharedStore]imageForKey:itemKey];
    self.imageView.image = imageToDisply;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // Clear first responder
    [self.view endEditing:YES];

    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
//    item.serialNumber = self.serialNumberField.text;
//    item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}
@end
