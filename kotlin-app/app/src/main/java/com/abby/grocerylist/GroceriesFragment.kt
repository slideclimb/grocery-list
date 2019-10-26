package com.abby.grocerylist

import android.os.Bundle
import android.view.*
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import com.google.firebase.firestore.FirebaseFirestore
import kotlinx.android.synthetic.main.groceries_fragment.*

/**
 * Fragment that contains the list that shows the groceries, and shows a form to add a new grocery
 * to the list.
 */
class GroceriesFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? =
        inflater.inflate(R.layout.groceries_fragment, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Obtain a reference to the firebase database.
        val db = FirebaseFirestore.getInstance()

        // Query the database for the groceries.
        val groceriesCollection = db.collection("groceries")

        // Add a listener to the query.
        groceriesCollection.addSnapshotListener { snapshot, _ ->
            // Put the returned groceries in a list.
            val groceries = snapshot?.map {
                Grocery(
                    it.id,
                    it.data["done"].toString().toBoolean(),
                    it.data["item"].toString()
                )
            } ?: listOf()

            // Display the groceries in two lists. The first list contains the to do items, and the
            // second list contains the done items.
            groceries_list?.apply {
                layoutManager = LinearLayoutManager(activity)
                adapter = GroceriesAdapter(groceries.filter { !it.done })
            }
            groceries_list_done.apply {
                layoutManager = LinearLayoutManager(activity)
                adapter = GroceriesAdapter(groceries.filter { it.done })
            }

            // Delete all the done items when clicking that button.
            delete_done_button.setOnClickListener {
                groceries.filter { it.done }.forEach { it.delete() }
            }
        }

    }
}