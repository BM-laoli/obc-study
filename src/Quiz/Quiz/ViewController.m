//
//  ViewController.m
//  Quiz
//
//  Created by administrator on 2023/9/5.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -method
- (IBAction)showQuestionButtonPressed:(UIButton *)sender
{
    
    self.currentQuestionIndex++;

//    NSLog(@"model questions length = %d \n", [self.model.questions count]);
//    NSLog(@"");
    if (self.currentQuestionIndex == [self.model.questions  count]) {

        // Go back to the first question
        self.currentQuestionIndex = 0;
    }

    // Get the string at the index in the questions array
    NSString *question = [self.model getAAndQ:self.currentQuestionIndex][0];
    self.questionLabel.text = question;
    
    //reset answer
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswerButtonPressed:(UIButton *)sender
{
    NSString *answer = [self.model getAAndQ:self.currentQuestionIndex][1];
    self.answerLabel.text = answer;
}

#pragma mark -initValue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // initModel q nad a
    self.model = [[Model alloc]initWithData:@[@"From what is cognac made?",
                                              @"What is 7+7?",
                                              @"What is the capital of Vermont?"]
                                   quertion: @[@"Grapes",
                                              @"14",
                                              @"Montpelier"]];
}


@end
