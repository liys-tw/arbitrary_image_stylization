#!/bin/bash
python ./src/arbitrary_image_stylization_with_weights.py \
    --checkpoint=./checkpoints/model.ckpt \
   	--output_dir=./images/stylized_images \
  	--style_images_paths=./images/style_images/*.jpg \
  	--content_images_paths=./images/content_images/*.jpg \
  	--image_size=256 \
  	--content_square_crop=False \
  	--style_image_size=256 \
  	--style_square_crop=False \
  	--logtostderr

INTERPOLATION_WEIGHTS='[0.0,0.2,0.4,0.6,0.8,1.0]'
python ./src/arbitrary_image_stylization_with_weights.py \
    --checkpoint=./checkpoints/model.ckpt \
    --output_dir=./images/stylized_weights_images \
    --style_images_paths=./images/style_images/Theo_van_Doesburg_sq.jpg \
    --content_images_paths=./images/content_images/statue_of_liberty_sq.jpg \
    --image_size=256 \
    --content_square_crop=False \
    --style_image_size=256 \
    --style_square_crop=False \
    --interpolation_weights=$INTERPOLATION_WEIGHTS \
    --logtostderr
    
python ./src/arbitrary_image_stylization_with_weights.py \
    --checkpoint=./checkpoints/model.ckpt \
    --output_dir=./images/stylized_weights_images \
    --style_images_paths=./images/style_images/qingming_festival.jpg \
    --content_images_paths=./images/content_images/taipei_101.jpg \
    --image_size=256 \
    --content_square_crop=False \
    --style_image_size=256 \
    --style_square_crop=False \
    --interpolation_weights=$INTERPOLATION_WEIGHTS \
    --logtostderr