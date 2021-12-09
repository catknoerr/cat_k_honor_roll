json.extract! review, :id, :dm_id, :rating, :reviewer_id, :review, :created_at,
              :updated_at
json.url review_url(review, format: :json)
