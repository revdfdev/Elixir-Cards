defmodule Cards do


  @moduledoc """
  Provide methods for creating and handling a deck of cards.
  """ 

  @doc """
  Returns a array representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four",  "Five",  "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen",  "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]



    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end

    #List.flatten(cards)

  end

  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into hand and the remainder of deck.
  The `hand_size` argument indicates how many cards should
  in the hand.

  ### Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,  binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "There is no such file."
    end
  end

  def create_hand(hand_size) do
    #deck = Cards.create_deck
    #Cards.shuffle(deck)
    #hand = Cards.deal(deck, hand_size)
    #hand

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end  
