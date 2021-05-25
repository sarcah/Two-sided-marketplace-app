class TransactionsController < ApplicationController
    def create
        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
            price_data: {
                unit_amount: 100,
                currency: 'aud',
                product_data: {
                # title: article.title,
                # author: article.author,
                name: 'article.title',
                images: ['https://i.imgur.com/EHyR2nP.png'],
                },
            },
            quantity: 1,
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: articles_url
        })
        
            render json: { id: session.id }
    end

    def success
    end
end    