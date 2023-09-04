'use strict';

var _ = require('underscore'),
    defaultOptions = require('./utils/defaultOptions'),
    scaleImages = require('./utils/scaleImages');

function sumUp(sum, value) {
    return sum + value;
}

module.exports = function generateLayout(images, options, callback) {
    options = _.extend({}, defaultOptions, options);

    images = scaleImages(images, options);
    var maxWidth =  _(images).chain().pluck('width').max().value()

    images = images.map((image) => {
      return {
        ...image,
        width: maxWidth,
        height: maxWidth / image.width * image.height
      }
    })

    var maxWidth =  _(images).chain().pluck('width').max().value()
    var maxHeight = _(images).chain().pluck('height').reduce(sumUp).value() + options.padding * (images.length - 1);

    images = _(images).map(function (image, it) {
        return _.extend({
            x: 0,
            y: it === 0 ? 0 : _(images).chain().pluck('height').first(it).reduce(sumUp).value() + options.padding * it,
            by: maxHeight
        }, image);
    });

    callback(null, {
        width: maxWidth,
        height: maxHeight,
        images: images,
        scaleSizes: options.scaleSizes
    });
};
