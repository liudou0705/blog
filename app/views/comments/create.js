$(".replies").append("<%= j render(partial: 'shared/comment', locals: {comment: @comment}) %>");
