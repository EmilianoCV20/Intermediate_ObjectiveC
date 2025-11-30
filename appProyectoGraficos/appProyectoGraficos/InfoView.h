//
//  InfoView.h
//  appProyectoGraficos
//
//  Created by Emiliano Cepeda on 31/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoView : UIView
{
    
}

@property (weak, nonatomic) IBOutlet UILabel *textoTitulo;
@property (weak, nonatomic) IBOutlet UILabel *textoDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imagen;

- (IBAction)segControlDesc:(UISegmentedControl *)sender;


@end

NS_ASSUME_NONNULL_END
