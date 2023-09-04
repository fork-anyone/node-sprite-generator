'use strict';

var fs = require('fs'),
    utils = require('../utils/stylesheet'),
    _ = require('underscore');

module.exports = function getTemplatedStylesheet(templatePath) {
    var template = _.template(fs.readFileSync(templatePath).toString());

    return function generateSpritesheet(layout, filePath, spritePath, options, callback) {
        var  defaults = {
                prefix: '',
                nameMapping: utils.nameToClass,
                spritePath: utils.getRelativeSpriteDir(spritePath, filePath),
            };

        options = _.extend({}, defaults, options);
        layout.images = layout.images.map(function(image) {
            var imageName = options.nameMapping(image.path),
            className = utils.prefixString(imageName, options);

            return _.extend(image, { className: className });
        });

        console.error(layout.scaleSizes);

        fs.writeFile(filePath, template({
            getCSSValue: utils.getCSSValue,
            spriteName: utils.prefixString('sprite', options),
            options: options,
            layout: layout
        }), callback);
    };
};
