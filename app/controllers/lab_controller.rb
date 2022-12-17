# frozen_string_literal: true

# Controller for main logic
class LabController < ApplicationController
  include LabHelper
  before_action :check_params, only: :show

  def input; end

  def show
    @checking = Result.find_by(number: params[:numb].to_i)
    @res = eval(@checking.arr) unless @checking.nil?
    return unless @res.nil?

    @res = if params[:numb] == ''
             0
           else
             LabHelper.palin([params[:numb]])
           end
    @res = LabHelper.palin_to_h(@res)
    Result.create!(number: @res[0]['val'].to_i, arr: @res.to_s)
  end

  def check_xml
    @a = Result.all.map do |elem|
      { 'number' => elem.number, 'arr' => elem.arr }
    end
    render xml: @a
  end

  private

  def check_params
    # logic for check for digits
    msg = if params[:numb].nil? || params[:numb] == ''
            'Nil class'
          elsif params[:numb].match?(/\D/)
            'Были введены не только цифры'
          end

    redirect_to root_path, notice: msg if msg
  end
end
