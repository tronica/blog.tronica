var urlUtils = require('../../lib/url-utils'),
    getContextObject = require('./context_object.js'),
    _ = require('lodash');

function getAuthorImage(data, absolute) {
    var context = data.context ? data.context : null,
        contextObject = getContextObject(data, context);

    if ((_.includes(context, 'post') || _.includes(context, 'page')) && contextObject.primary_author && contextObject.primary_author.profile_image) {
        return urlUtils.urlFor('image', {image: contextObject.primary_author.profile_image}, absolute);
    }
    return null;
}

module.exports = getAuthorImage;
