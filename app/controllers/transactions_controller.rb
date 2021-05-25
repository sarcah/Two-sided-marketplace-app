class TransactionsController < ApplicationController
    def create
        article = Article.find params["id"]
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [
            {
                price_data: {
                    unit_amount: article.price*100,
                    currency: 'aud',
                    product_data: {
                        name: article.title
                    },
                },
                quantity: 1,
            }],
            mode: 'payment',
            success_url: rails_blob_url(article.image, disposition: "attachment"),
            cancel_url: articles_url,
        })
        render json: { id: session.id }
    end
    def success
    end
end   