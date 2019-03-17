'use strict';

module.exports.query = async (event, context) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Deployed using Serverless',
      input: event,
    }),
  };
};
