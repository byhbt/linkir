defmodule Linkir.LinksTest do
  use Linkir.DataCase

  alias Linkir.Links

  describe "links" do
    alias Linkir.Links.Schemas.Link

    @valid_attrs %{
      click_count: 42,
      content: "some content",
      full_url: "some full_url",
      short_url: "some short_url"
    }
    @update_attrs %{
      click_count: 43,
      content: "some updated content",
      full_url: "some updated full_url",
      short_url: "some updated short_url"
    }
    @invalid_attrs %{click_count: nil, content: nil, full_url: nil, short_url: nil}

    def link_fixture(attrs \\ %{}) do
      {:ok, link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Links.create_link()

      link
    end

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Links.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Links.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.click_count == 42
      assert link.content == "some content"
      assert link.full_url == "some full_url"
      assert link.short_url == "some short_url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Links.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      assert {:ok, %Link{} = link} = Links.update_link(link, @update_attrs)
      assert link.click_count == 43
      assert link.content == "some updated content"
      assert link.full_url == "some updated full_url"
      assert link.short_url == "some updated short_url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Links.update_link(link, @invalid_attrs)
      assert link == Links.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Links.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Links.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Links.change_link(link)
    end
  end
end
