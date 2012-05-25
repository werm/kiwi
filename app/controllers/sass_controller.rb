class SassController < ApplicationController
  skip_authorization_check

  def compile
    resp = { css: Kiwi::CompilerService.compile(params["scss"]) }
    respond_to do |format|
      format.json { render json: resp }
    end
  end
end
