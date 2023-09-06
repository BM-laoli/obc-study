//
//  ViewController.h
//  Quiz
//
//  Created by administrator on 2023/9/5.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController

@property (nonatomic, assign) int currentQuestionIndex;
@property (nonatomic, strong) Model *model;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

- (IBAction)showQuestionButtonPressed:(UIButton *)sender;
- (IBAction)showAnswerButtonPressed:(UIButton *)sender;

@end

