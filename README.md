# Fast Style Transfer for Arbitrary Styles
fast artistic style transfer that may work on arbitrary painting styles.

## Stylizing an Image using a pre-trained model
* Set up your environment with anaconda, install [requirements](/requirements.txt).
```bash
$ conda create -n image_stylization python=3.6
$ conda activate image_stylization
$ pip install -r requirements.txt
```

* Download pre-trained model to [checkpoint path](/checkpoints): [Pretrained on PNB and DTD training images](https://storage.googleapis.com/download.magenta.tensorflow.org/models/arbitrary_style_transfer.tar.gz)
```bash
$ cd /path/to/arbitrary_image_stylization/checkpoints
$ wget https://storage.googleapis.com/download.magenta.tensorflow.org/models/arbitrary_style_transfer.tar.gz
$ tar zxvf arbitrary_style_transfer.tar.gz
$ mv arbitrary_style_transfer/* ./
$ rm -r arbitrary_style_transfer
$ rm arbitrary_style_transfer.tar.gz
```

* Run the following command, stylize an image according to an arbitrary painting.
```bash
# To use images in style_images and content_images directories.
$ cd /path/to/arbitrary_image_stylization
$ python ./src/arbitrary_image_stylization_with_weights.py \
    --checkpoint=./checkpoints/model.ckpt \
    --output_dir=./images/stylized_images \
    --style_images_paths=./images/style_images/*.jpg \
    --content_images_paths=./images/content_images/*.jpg \
    --image_size=256 \
    --content_square_crop=False \
    --style_image_size=256 \
    --style_square_crop=False \
    --logtostderr
```

* Run the following command where $INTERPOLATION_WEIGHTS represents the desired weights for interpolation, stylize an image using the "identity interpolation" technique (see Figure 8 in paper).
```bash
# To use images in style_images and content_images directories.
$ cd /path/to/arbitrary_image_stylization
# Note that 0.0 corresponds to an identity interpolation where as 1.0
# corresponds to a fully stylized photograph.
$ INTERPOLATION_WEIGHTS='[0.0,0.2,0.4,0.6,0.8,1.0]'
$ python ./src/arbitrary_image_stylization_with_weights.py \
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
```


