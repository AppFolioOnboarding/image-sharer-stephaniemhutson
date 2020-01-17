module Api
  class FeedbacksController < ApplicationController

    def create
      feedback = feedback_params
      if feedback[:name].blank? or feedback[:comments].blank?
        # When the Feedback model exists, we will allow the model to raise
        # this error
        raise ActiveModel::StrictValidationFailed
      end
      # TODO: (Stephanie Hutson) Actually create Feedback. So far the model
      # does not exist
    end

    def feedback_params
      params.require('feedback').permit(['name', 'comments'])
    end
  end
end
