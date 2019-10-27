package com.abby.grocerylist

import com.google.firebase.firestore.CollectionReference
import com.google.firebase.firestore.FirebaseFirestore

/**
 * Class keeping a reference to the database, and to the collection of groceries.
 *
 * This class also provides some helper methods.
 */
class FirebaseHelper(private val db: FirebaseFirestore = FirebaseFirestore.getInstance(),
                     val collection: CollectionReference = db.collection("groceries")) {

    /**
     * Delete all the groceries from the collection.
     */
    fun deleteAll() {
        collection.get().addOnSuccessListener {snapshot ->
            // Put the returned groceries in a list.
            val groceries = snapshot?.map {
                Grocery(
                    it.id,
                    it.data["done"].toString().toBoolean(),
                    it.data["item"].toString()
                )
            } ?: listOf()
            // Delete all the groceries.
            groceries.forEach { it.delete() }
        }
    }

}